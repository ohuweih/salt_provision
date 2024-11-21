import boto3

sticky=True
targetGroupArn='arn:aws:elasticloadbalancing:us-east-1:324053739222:targetgroup/gaies-pe-uat-flask-targetgroup/3f75751389dc3c9d'
priority=160
hostHeader=['policyuat.tools.gateway.ga.gov']
method=['POST','OPTIONS']


def create_rule(sticky, targetGroupArn, priority, hostHeader=[], method=[]):
    listenerlb = 'arn:aws:elasticloadbalancing:us-east-1:324053739222:listener/app/gaies-pe-uat-LoadBalancer/273e60a94e6f60a0/94b14564b57ea97b'
    client = boto3.client('elbv2', region_name='us-east-1')
    if hostHeader != [] and method != []:
        create_rules = client.create_rule(
                ListenerArn=listenerlb,
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

create_rule(sticky, targetGroupArn, priority, hostHeader, method)
