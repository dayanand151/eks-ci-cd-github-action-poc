# Rakbank Assignment

This repository contains the necessary configurations and scripts for deploying a sample application to an AWS EKS cluster using Helm, along with tools for code quality, dependency management, and security scanning.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Deployment](#deployment)
  - [Using Makefile](#using-makefile)
  - [Manual Steps](#manual-steps)
- [Clean Up](#clean-up)
  - [Using Makefile](#using-makefile-1)
  - [Manual Steps](#manual-steps-1)
- [Ingress Setup](#ingress-setup)
  - [TLS Secret Creation](#tls-secret-creation)
  - [Ingress Configuration](#ingress-configuration)
  - [Sample `ingress.yaml` File](#sample-ingressyaml-file)
- [Code Quality and Security](#code-quality-and-security)
  - [SonarQube](#sonarqube)
  - [Maven](#maven)
  - [GitLeaks](#gitleaks)
- [Usage](#usage)
- [Files and Directories](#files-and-directories)
- [Components Used](#components-used)

## Prerequisites

- AWS CLI
- kubectl
- Helm
- AWS account with appropriate permissions to create resources
- An EKS cluster
- Docker
- Maven
- SonarQube
- GitLeaks

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/rakbankdubai/rakbank-assignment.git
    cd rakbank-assignment
    ```

2. Configure AWS CLI:
    ```sh
    aws configure
    ```

3. Update kubeconfig for EKS:
    ```sh
    aws eks --region <region> update-kubeconfig --name <cluster-name>
    ```

## Deployment

### Using Makefile

1. Package the Helm chart:
    ```sh
    make package
    ```

2. Deploy the application:
    ```sh
    make install
    ```

3. Verify the deployment:
    ```sh
    kubectl get all
    ```

### Manual Steps

1. Package the Helm chart:
    ```sh
    cd rakbankhelm
    helm package .
    cd ..
    ```

2. Deploy the application:
    ```sh
    helm install rakbank ./rakbankhelm-*.tgz
    ```

3. Verify the deployment:
    ```sh
    kubectl get all
    ```

## Clean Up

### Using Makefile

1. Uninstall the application:
    ```sh
    make uninstall
    ```

2. Clean up packaged files:
    ```sh
    make clean
    ```

### Manual Steps

1. Uninstall the application:
    ```sh
    helm uninstall rakbank
    ```

## Ingress Setup

### TLS Secret Creation

1. Create a TLS secret for your ingress:
    ```sh
    kubectl create secret tls <secret-name> --cert=<path-to-cert> --key=<path-to-key>
    ```

### Ingress Configuration

1. Update your `values.yaml` file to include ingress configurations:
    ```yaml
    ingress:
      enabled: true
      annotations:
        kubernetes.io/ingress.class: nginx
        cert-manager.io/cluster-issuer: letsencrypt
      hosts:
        - host: <your-domain>
          paths:
            - path: /
              pathType: Prefix
      tls:
        - secretName: <secret-name>
          hosts:
            - <your-domain>
    ```

2. Deploy the ingress:
    ```sh
    helm upgrade --install rakbank ./rakbankhelm-*.tgz -f values.yaml
    ```

3. Verify the ingress:
    ```sh
    kubectl get ingress
    ```

### Sample `ingress.yaml` File

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: rakbank-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt
spec:
  rules:
    - host: <your-domain>
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: <service-name>
                port:
                  number: <service-port>
  tls:
    - hosts:
        - <your-domain>
      secretName: <secret-name>

