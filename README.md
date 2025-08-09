# これは何

ansible でユーザ作成の環境を自動化する構成です　<br>
(今回は例としてLinux のユーザですが、Ansible を書き換えていただければ
他の用途にも使用できます。)


## Ansible 
一番分かりやすいように、Linux のユーザ作成のYAML を採用しています。
ansible はできているので、使用いただけます。


## Terraform
環境構築も自動で作成されるように、Terraform を準備中です。

### 構成

- s3
- ec2
- vpc
- cicd (Code Build・ Code Pipeline)
- parameter store (ssh key 保管用途)

###　module



## 手順

### parameter store でのssh key・IP の保存
buildspec yml のenv に合わせて、parameter store でそれぞれを作成していってください。
```bash
env:
  variables:
    my-ssh-key: "my-ssh-key"
    private-ip: "private-ip"
```

### variable.yml の修正
variable.yml はtest ユーザが作成されるようになっています。自分の作成したいユーザ名に <br/>
変更してください

### S3 の名称を変更
buildspec yml のpostbuild でのs3 名称を自分専用に変更してください。

```bash
# artifact の保存 ( s3 に秘密鍵と public key を保存)
  post_build:
    commands:
      - echo "start saving artifact to s3"
      - aws s3 cp private_key s3://ansible-linux-users/private_key
      - aws s3 cp public_key s3://ansible-linux-users/authorized_keys

```

### ここまで編集したら、一度ローカルでテストすることをお勧めします
host で名称を管理しても大丈夫です。公開のものなので、IPを指定しています。

```bash
ansible-playbook -i "<your-ip>," target.yml --private-key private.pem --check

```