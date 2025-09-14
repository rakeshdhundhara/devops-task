

# resource "aws_ecs_cluster" "task-cluster" {
#   name = var.cluster_name
# }

# resource "aws_ecs_task_definition" "this" {
#   family                   = var.task_family
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = "256"
#   memory                   = "512"

#   execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

#   container_definitions = jsonencode([
#     {
#       name      = var.container_name
#       image     = var.ecr_image_url
#       essential = true
#       portMappings = [
#         {
#           containerPort = var.container_port
#           hostPort      = var.container_port
#         }
#       ],
#       logConfiguration = {
#         logDriver = "awslogs",
#         options = {
#           awslogs-group         = "/ecs/${var.task_family}"
#           awslogs-region        = "ap-south-1"
#           awslogs-stream-prefix = "ecs"
#         }
#       }
#     }
#   ])
# }

# resource "aws_iam_role" "ecs_task_execution_role" {
#   name               = "ecsTaskExecutionRole"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }

# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     actions = ["sts:AssumeRole"]
#     principals {
#       type        = "Service"
#       identifiers = ["ecs-tasks.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
#   role       = aws_iam_role.ecs_task_execution_role.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }

# resource "aws_ecs_service" "this" {
#   name            = "${var.cluster_name}-service"
#   cluster         = aws_ecs_cluster.this.id
#   task_definition = aws_ecs_task_definition.this.arn
#   desired_count   = 1
#   launch_type     = "FARGATE"

#   network_configuration {
#     subnets         = var.subnet_ids
#     security_groups = [var.security_group_id]
#     assign_public_ip = false
#   }

#   load_balancer {
#     target_group_arn = var.target_group_arn
#     container_name   = var.container_name
#     container_port   = var.container_port
#   }

#   depends_on = [aws_ecs_task_definition.this]
# }
resource "aws_ecs_cluster" "ECS" {
  name = "my-cluster"

  tags = {
    Name  = "${var.instance_name}-sg"
    owner = var.owner
  }
}
resource "aws_ecs_task_definition" "TD" {
  family                   = "nginx"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions = jsonencode([
    {
      name      = "main-container"
      image     = var.repository_url
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}


data "aws_ecs_task_definition" "TD" {
  task_definition = aws_ecs_task_definition.TD.family
}
