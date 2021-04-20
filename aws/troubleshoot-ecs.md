# Troubleshoot ECS

I didn't know, or forgot, where to find error logs for ECS. If you're having
trouble launching an app on ECS, you can find an error message as follows,

  1. AWS console
  2. ECS console
  3. Clusters pane
  4. Services table
  5. Select the service of interest
  6. Tasks pane
  7. Toggle STOPPED (from RUNNING)
  8. Select as Task
  9. Expand to see the error message

Hopefully, it's something simple to fix, like adding an inline policy in IAM.