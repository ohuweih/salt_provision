{% set state_id_prefix = "ecs" %}

{% if pillar['ecsClusters'] is defined %}
{% set ecsClusters = pillar['ecsClusters'] %}
{% if ecsCluster.ecsServices  is defined %}
{% set ecsServices = ecsCluster.ecsServices %}
{% if ecsCluster.ecsTasks  is defined %}
{% set ecsTasks = ecsCluster.ecsTasks %}
{% set env = salt['grains.get']('env') %}

{% for ecsCluster in ecsClusters %} 


{{state_id_prefix}}_create_ecs_log_group:
  module.run:
    - name: cloudwatch_utils.createLogGroup
    - logGroupName: {{ ecsCluster.serviceName }}_{{ecsCluster.taskDefinition }}/ecs/


### create ECS cluster, task, and service. in that order ###
{{state_id_prefix}}_create_cluster_{{ ecsCluster.clusterName }}:
  module.run:
    - name: ecs_utils.createCluster
    - clusterName: {{ ecsCluster.clusterName }}
    - tags: {{ ecsCluster.clusterTags | tojson }}



{% for ecsTask in ecsTasks %}

{{state_id_prefix}}_create_task_def_{{ ecsTask.taskDefinition }}:
  module.run:
    - name: ecs_utils.createTaskDefinition
    - taskDefinition: {{ ecsTask.taskDefinition }}
    - tags: {{ ecsTask.taskTags | tojson }}
    - serviceName: {{ ecsTask.serviceName }}
    - image: {{ ecsTask.image }}
    - containerPort: {{ ecsTask.containerPort }}
    - logGroup: {{ ecsTask.logGroup }}
    - taskRole: {{ ecsTask.taskRole }}
    - hostPort: {{ ecsTask.hostPort }}
    - envVar: {{ ecsTask.envVar}}
    - executionRole: {{ ecsTask.executionRole }}
    - credentialsParameter: {{ ecsTask.credentialsParameter }}
{% endfor %}


{% for ecsService in ecsServices %}

{{state_id_prefix}}_create_service_{{ ecsServices.serviceName }}:
  module.run:
    - name: ecs_utils.createService
    - serviceName: gaies-pe-uat-{{ ecsService.serviceName }}
    - taskDefinition: {{ ecsService.taskDefinition }}:0
    - clusterName: {{ ecsService.clusterName }}
    - containerPort: {{ ecsService.containerPort }}
    - targetGroup: {{ecsService.targetGroup }}
    - subnetA: {{ ecsService.subnetA }}
    - subnetB: {{ ecsService.subnetB }}
    - tags: {{ ecsService.ecsServiceTags | tojson }}
    - containerSecGrp: {{ ecsService.containerSecGrp }}


{{state_id_prefix}}_create_auto_scaling_{{ ecsService.serviceName }}
  module.run:
    - name: ec2_utils.createScalingTarget
    - resourceId: service/{{ecsService.clusterName}}/gaies-pe-{{ env }}-{{ ecsService.serviceName }}
    - minContainers: {{ ecsService.minContainers }}
    - maxContainers: {{ ecsService.maxContainers }}
{% endfor %}


{% endfor %}
{% endif %}
{% endif %}
{% endif %}