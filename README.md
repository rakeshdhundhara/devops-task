# DevOps Task - CI/CD Pipeline for Node.js App

## 1. Objective

Create a **CI/CD pipeline** for a Node.js application using **Jenkins**, **GitHub**, and **Docker**, demonstrating automation and DevOps practices.

---

## 2. Repository

- GitHub Repo: [https://github.com/rakeshdhundhara/devops-task](https://github.com/rakeshdhundhara/devops-task)
- Branches:

  - `main` → Stable code

---

## 3. Pipeline Overview

**Flow:**

```
GitHub → ngrok → Jenkins Pipeline → Docker → Docker Hub / Minikube
```

**Pipeline Stages:**

1. **Checkout** → Pull code from GitHub
2. **Build** → Install dependencies & run tests
3. **Dockerize** → Build Docker image
4. **Push** → Push image to Docker Hub
5. **Deploy** → Deploy to Minikube (local Kubernetes)

**Note:** Cloud deployment not done due to system limitations.

---

## 4. Tools & Technologies

- **Node.js** – App runtime
- **GitHub** – Version control
- **Jenkins** – CI/CD automation
- **Docker** – Containerization
- **Docker Hub** – Image registry
- **ngrok** – Local webhook testing
- **Terraform** – IaC scripts written (not deployed)

---

## 5. Setup Steps

1. **Install Jenkins Plugins:**

   - Pipeline, Git, Docker Pipeline

2. **Add Credentials in Jenkins:**

   - GitHub Token → `github-token`
   - Docker Hub → `dockercredentialA`

3. **Webhook Setup:**

   - Run `ngrok http 8080` to expose Jenkins locally
   - Configure GitHub webhook to trigger Jenkins

---

## 6. Deployment Proof

- CI/CD pipeline executed successfully **locally**
- Docker image pushed: `rakeshbarwala/devops-task:latest`
- Jenkins stages: **Build → Dockerize → Push**
- Deployment tested locally via Minikube

---

## 7. Challenges & Notes

- Limited system resources prevented cloud deployment
- Terraform scripts written for cloud automation, but not deployed

"I was also able to integrate monitoring tools like Datadog and New Relic for observability, but due to limited resources, I could not implement full-scale deployment. With better resources, I could have enhanced this project even further."
