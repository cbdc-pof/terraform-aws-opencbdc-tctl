### CUSTOM BANK OF CANADA AUTO SHUTDOWN
resource "aws_autoscaling_schedule" "test-controller-autoshutdown" {
  count= var.test_controller_launch_type == "EC2" ? 1 : 0
  scheduled_action_name  = "auto-shutdown"
  min_size= 0
  max_size= 1
  desired_capacity= 0
  start_time= "2023-05-18T21:00:00Z"
  recurrence= "0 17 * * *"
  time_zone= "America/Toronto"
  autoscaling_group_name = module.ecs_cluster_asg[0].this_autoscaling_group_name

  lifecycle {
   ignore_changes = [
    start_time
   ]
 }
}
### END OF CUSTOM CODE
