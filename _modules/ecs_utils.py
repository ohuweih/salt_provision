import boto3


def createCluster(clusterName, region="us-east-1", clusterSettings=[], clusterConfig={}, clusterProviders=['FARGATE', 'FARGATE_SPOT'], clusterProviderStrategy=[], clusterConnectDefaults={'namespace': 'gaies-pe'}):
    client = boto3.client('ecs', region_name=region)
    try:
        print(f"Checking if {clusterName} exists")
        checkCluster = client.describe_clusters(
            clusters=[
                clusterName
            ]
        )
        for cluster in checkCluster['clusters']:
            if clusterName in cluster['clusterName']:
                print(f"Cluster {clusterName} already exists.")
                print(f"Ensuring Cluster {clusterName} is up to date with Pillar Data")
                if cluster['settings'] != clusterSettings:
                    response = client.update_cluster(
                        cluster=clusterName,
                        settings=clusterSettings,
                        configuration=clusterConfig,
                        serviceConnectDefaults=clusterConnectDefaults
                    )
                    print(f"Updated Cluster {clusterName}")
                    return
                print("Nothing to update")
                return
        print(f"Cluster {clusterName} does not exist, Creating")
        try:
            response = client.create_cluster(
            clusterName=clusterName,
            capacityProviders=clusterProviders,
            serviceConnectDefaults=clusterConnectDefaults
            )
            print(response)
            print (f"Cluster {clusterName} created")
        except Exception as e:
            print(e)
    except Exception as e:
        print(e)


def createTaskDefinition(taskDefinition, tags, serviceName, image, hostPort, containerPort, logGroup, taskRole, executionRole, credentialsParameter, requiresCompatibilities=['FARGATE'], region='us-east-1', envVar=[]):
    tag_list = [{'key': key, 'value': value} for key, value in tags.items()]
    client = boto3.client('ecs', region_name=region)
    try:
        print(f"Checking if {taskDefinition} exists")
        checkTask = client.describe_task_definition(
            taskDefinition='gaies-pe-dev-salt-boss-mode',
        )
        taskData = checkTask['taskDefinition']['containerDefinitions'][0]
        print(f"Ensuring task {taskDefinition} is up to date with Pillar Data")
        if taskData['image'] != image or taskData['portMappings'][0]['containerPort'] != containerPort or checkTask['taskDefinition']['requiresCompatibilities'] != requiresCompatibilities:
            print(f"Updating task {taskDefinition}")
            response = client.register_task_definition(
                family=taskDefinition,
                taskRoleArn=taskRole,
                executionRoleArn=executionRole,
                networkMode="awsvpc",
                requiresCompatibilities=requiresCompatibilities,
                cpu="4096",
                memory="8192",
                containerDefinitions=[
                    {
                        "name": serviceName,
                        "image": image,
                        'repositoryCredentials': {
                            'credentialsParameter': credentialsParameter
                        },
                        "portMappings": [
                            {
                                "name": serviceName,
                                "containerPort": containerPort,
                                "hostPort": hostPort,
                                "protocol": "tcp"
                            }
                        ],
                        "environment" : envVar,
                        "logConfiguration": {
                            "logDriver": "awslogs",
                            "options": {
                                "awslogs-region": 'us-east-1',
                                "awslogs-group": logGroup,
                                "awslogs-create-group": "true",
                                "awslogs-stream-prefix": "ecs"
                            }
                        }
                    }
                ],
                tags=tag_list
            )
            print("Task updated! New revision now posted")
            print(response)
        else:
            print("Task is already up to date")
    except Exception as e:
        print(e)
        print("Creating")
        response = client.register_task_definition(
            family=taskDefinition,
            taskRoleArn=taskRole,
            executionRoleArn=executionRole,
            networkMode="awsvpc",
            requiresCompatibilities=requiresCompatibilities,
            cpu="4096",
            memory="8192",
            containerDefinitions=[
                    {
                        "name": serviceName,
                        "image": image,
                        'repositoryCredentials': {
                            'credentialsParameter': credentialsParameter
                        },
                        "portMappings": [
                            {
                                "name": serviceName,
                                "containerPort": containerPort,
                                "hostPort": hostPort,
                                "protocol": "tcp"
                            }
                        ],
                        "environment" : envVar,
                        "logConfiguration": {
                            "logDriver": "awslogs",
                            "options": {
                                "awslogs-region": 'us-east-1',
                                "awslogs-group": logGroup,
                                "awslogs-create-group": "true",
                                "awslogs-stream-prefix": "ecs"
                            }
                        }
                    }
            ],
            tags=tag_list
        )
        print(response)


def createService(serviceName, taskDefinition, clusterName, containerPort, targetGroup, subnetA, subnetB, tags, containerSecGrp, region="us-east-1"):
    tag_list = [{'key': key, 'value': value} for key, value in tags.items()]
    client = boto3.client('ecs', region_name=region)
    try:
        print(f"service {serviceName} does not exist, Creating")
        response = client.update_service(
        cluster=clusterName,
        serviceName=serviceName,
        taskDefinition=taskDefinition,
        deploymentConfiguration={
            "minimumHealthyPercent": 100,
            "maximumPercent": 200
        },
        desiredCount=2,
        healthCheckGracePeriodSeconds=30,
        capacityProviderStrategy=[
            {
                'capacityProvider': 'FARGATE',
                'weight': 2,
                'base': 2
            },
        ],
        networkConfiguration={
            "awsvpcConfiguration" : {
                "assignPublicIp": "DISABLED",
                "subnets": [
                    subnetA,
                    subnetB,
                ],
                "securityGroups" : [
                    containerSecGrp
                ]
            }
        },
        loadBalancers=[
            {
                "containerName": serviceName,
                "containerPort": containerPort,
                "targetGroupArn": targetGroup
            }
        ]
    )
    except Exception as e:
        print(e)
        return False