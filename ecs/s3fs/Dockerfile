FROM amazonlinux:2

RUN yum update -y \
	&& amazon-linux-extras install epel -y \
	&& yum install -y s3fs-fuse
ENTRYPOINT s3fs -f -d -o iam_role=custom-tt-dev-s3-role -o url=https://s3.sa-east-1.amazonaws.com -o endpoint=sa-east-1 -o dbglevel=info -o curldbg -o allow_other -o use_cache=/tmp rcs-s3-private /tmp -o use_path_request_style -o umask=0022,uid=998,gid=998
