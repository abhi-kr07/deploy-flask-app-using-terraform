resource "aws_key_pair" "mykey" {
    key_name = "My-Key"
    public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "myinstance" {
    ami = var.ami_value
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my-sg.id]
    subnet_id = aws_subnet.sub1.id
    key_name = aws_key_pair.mykey.key_name

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("~/.ssh/id_ed25519")
      host = self.public_ip
    }

    provisioner "file" {
        source = "app.py"
        destination = "/home/ubuntu/app.py"
    }

    provisioner "remote-exec" {
        inline = [
            "echo 'Hello from the DevOps team'" ,
            "sudo apt update -y" ,
            "sudo apt install -y python3-pip" ,
            "cd /home/ubuntu",
            "sudo apt install -y python3-flask" ,
            "sudo python3 app.py &" ,

        ]
      
    }
}



