# Architecture

![Screenshot 2025-05-06 115600](https://github.com/user-attachments/assets/773570ab-7147-42c8-ba6f-dc76b4c4af20)

### How to execute

```
for i in 01-vpc 02-sg 03-bastion 04-db 05-apps; do cd $i; terraform init; terraform plan; terraform apply -auto-approve; cd ..; done
```

### How to destroy

```
for i in 05-apps 04-db 03-bastion 02-sg 01-vpc; do cd $i; terraform destroy -auto-approve; cd ..; done
```
