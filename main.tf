resource "aws_launch_template" "aws_launch_template" {
  name = var.name
  description = "Launch template for ${var.name}"
  tags = {
    Name = var.name
  }
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.name
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      Name = var.name
    }
  }
  tag_specifications {
    resource_type = "network-interface"
    tags = {
      Name = var.name
    }
  }
  user_data = base64encode(var.user_data)
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = var.volume_size
      volume_type = "gp2"
      delete_on_termination = true
    }
  }
  update_default_version = true
}
