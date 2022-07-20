resource "aws_ebs_volume" "webvolume" {
    count = 3
    availability_zone = "us-east-1d"
    size = 10
    tags = {
      "Name" = "web ${count.index}"
    }

}

resource "aws_volume_attachment" "web_attach" {
    count = 3
    device_name = "${var.device_name[count.index]}"
    volume_id = "${aws_ebs_volume.webvolume.*.id[count.index]}"
    instance_id = "${aws_instance.webserver.id}"
}

resource "aws_ebs_volume" "DBvolume" {
    count = 3
    availability_zone = "us-east-1d"
    size = 10
    tags = {
      "Name" = "db ${count.index}"
    }

}

resource "aws_volume_attachment" "DB_attach" {
    count = 3
    device_name = "${var.device_name_db[count.index]}"
    volume_id = "${aws_ebs_volume.DBvolume.*.id[count.index]}"
    instance_id = "${aws_instance.database.id}"
}
