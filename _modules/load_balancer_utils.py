import boto3

def create_tg(tgname, protocol, port, vpc_id, health_check_path, health_check_interval_seconds, health_check_timeout_seconds, healthy_threshold_count, unhealthy_threshold_count):
    client = boto3.client('elbv2', region_name='us-east-1')
    response = client.create_target_group(
        Name=tgname,
        Protocol=protocol,
        Port=port,
        VpcId=vpc_id,
        HealthCheckEnabled=True,
        HealthCheckPath=health_check_path,
        HealthCheckIntervalSeconds=health_check_interval_seconds,
        HealthCheckTimeoutSeconds=health_check_timeout_seconds,
        HealthyThresholdCount=healthy_threshold_count,
        UnhealthyThresholdCount=unhealthy_threshold_count,
        TargetType='ip',
        IpAddressType='ipv4'
    )
    return response

def create_lb(loadBalancerName, scheme, defaultTargetGroupArn, protocol, port, certificateArn, subnets=[], securityGroups=[]):
    client = boto3.client('elbv2', region_name='us-east-1')
    lb = client.create_load_balancer(
            Name=loadBalancerName,
            Subnets=subnets,
            SecurityGroups=['sg-0df889d369b078017'],
            Scheme=scheme,
            Type='application',
            IpAddressType='ipv4'
        )
    lbarn = lb['LoadBalancers'][0]['LoadBalancerArn']
    listeners = client.create_listener(
            LoadBalancerArn=lbarn,
            Protocol=protocol,
            Port=port,
            Certificates=[
                {
                    'CertificateArn': certificateArn
                }
            ],
            DefaultActions=[
                {
                    'Type': 'forward',
                    'TargetGroupArn': defaultTargetGroupArn
                }
            ],
        )
    listenerlb = listeners['Listeners'][0]['ListenerArn']
    __salt__['grains.set']('listenerld', listenerlb)
    return listenerlb


def create_rule(sticky, targetGroupArn, priority, tags, hostHeader=[], method=[]):
    listenerlb = 'arn:aws:elasticloadbalancing:us-east-1:324053739222:listener/app/gaies-pe-uat-LoadBalancer/273e60a94e6f60a0/94b14564b57ea97b'
    client = boto3.client('elbv2', region_name='us-east-1')
    if hostHeader != [] and method != []:
        create_rules = client.create_rule(
                ListenerArn=listenerlb,
                Tags=tags,
                Conditions=[
                    {
                        'Field': 'host-header',
                        'HostHeaderConfig': {
                            'Values': hostHeader
                        }
                    },
                    {
                        'Field': 'http-request-method',
                        'HttpRequestMethodConfig': {
                            'Values': method
                        }
                    }
                ],
                Actions= [
                    {
                        'ForwardConfig':{
                            'TargetGroupStickinessConfig': {
                                'DurationSeconds': 3600,
                                'Enabled': sticky
                            },
                            'TargetGroups': [
                                {
                                    'TargetGroupArn': targetGroupArn,
                                    'Weight': 1
                                }
                            ]
                        },
                        'Order': 1,
                        'TargetGroupArn': targetGroupArn,
                        'Type': 'forward'
                    }
                ],
               Priority=priority
        )
        print(create_rules)
    if hostHeader != [] and method == []:
        create_rules = client.create_rule(
                ListenerArn=listenerlb,
                Tags=tags,
                Conditions=[
                    {
                        'Field': 'host-header',
                        'HostHeaderConfig': {
                            'Values': hostHeader
                        }
                    }
                ],
                Actions= [
                    {
                        'ForwardConfig':{
                            'TargetGroupStickinessConfig': {
                                'DurationSeconds': 3600,
                                'Enabled': sticky
                            },
                            'TargetGroups': [
                                {
                                    'TargetGroupArn': targetGroupArn,
                                    'Weight': 1
                                }
                            ]
                        },
                        'Order': 1,
                        'TargetGroupArn': targetGroupArn,
                        'Type': 'forward'
                    }
                ],
               Priority=priority
        )
    if hostHeader == [] and method != []:
        create_rules = client.create_rule(
                ListenerArn=listenerlb,
                Tags=tags,
                Conditions=[
                    {
                        'Field': 'http-request-method',
                        'HttpRequestMethodConfig': {
                            'Values': method
                        }
                    }
                ],
                Actions= [
                    {
                        'ForwardConfig':{
                            'TargetGroupStickinessConfig': {
                                'DurationSeconds': 3600,
                                'Enabled': sticky
                            },
                            'TargetGroups': [
                                {
                                    'TargetGroupArn': targetGroupArn,
                                    'Weight': 1
                                }
                            ]
                        },
                        'Order': 1,
                        'TargetGroupArn': targetGroupArn,
                        'Type': 'forward'
                    }
                ],
               Priority=priority
        )
    return create_rules