# Kubernetes 监控栈 (Helm)

基于 `kube-prometheus-stack` 的完整 Kubernetes 监控解决方案。

## ✨ 特性

- ✅ **Prometheus** - 时序数据库和监控系统
- ✅ **Grafana** - 强大的可视化仪表板
- ✅ **AlertManager** - 告警管理和通知
- ✅ **Kube State Metrics** - Kubernetes 集群指标收集
- ✅ **预装仪表板** - 开箱即用的监控面板

## 🚀 快速开始

### 前置要求

- Kubernetes 集群（minikube / kind / Docker Desktop）
- Helm 3.x

### 安装步骤
```bash
# 1. 克隆项目
git clone https://github.com/yourusername/helm-monitoring-stack.git
cd helm-monitoring-stack

# 2. 安装 Helm（如果还没装）
brew install helm  # macOS
# 或访问 https://helm.sh/docs/intro/install/

# 3. 添加 Chart 仓库
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# 4. 一键启动监控栈
./start-monitoring.sh
```

## 📊 访问服务

### Grafana 仪表板
```bash
# 启动端口转发
./access-grafana.sh

# 或手动执行
kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80
```

**访问地址**: http://localhost:3000

**登录信息**:
- 用户名: `admin`
- 密码: `admin123`

### Prometheus
```bash
kubectl port-forward -n monitoring svc/monitoring-kube-prometheus-prometheus 9090:9090
```

**访问地址**: http://localhost:9090

## 🛠️ 管理命令
```bash
# 启动监控栈
./start-monitoring.sh

# 访问 Grafana
./access-grafana.sh

# 停止并清理
./stop-monitoring.sh

# 查看状态
helm list -n monitoring
kubectl get pods -n monitoring

# 升级配置
helm upgrade monitoring prometheus-community/kube-prometheus-stack \
  -f monitoring-values.yaml -n monitoring

# 回滚版本
helm rollback monitoring -n monitoring
```

## ⚙️ 自定义配置

编辑 `monitoring-values.yaml` 来自定义你的配置：
```yaml
grafana:
  adminPassword: "your-password"  # 修改 Grafana 密码
  
prometheus:
  prometheusSpec:
    retention: 15d  # 修改数据保留时间
```

修改后执行：
```bash
helm upgrade monitoring prometheus-community/kube-prometheus-stack \
  -f monitoring-values.yaml -n monitoring
```

## 📈 预装仪表板

Grafana 包含以下预装仪表板：

- **Kubernetes / Compute Resources / Cluster** - 集群资源概览
- **Kubernetes / Compute Resources / Namespace** - 命名空间监控
- **Kubernetes / Compute Resources / Pod** - Pod 级别监控
- **Node Exporter Full** - 节点详细监控
- **Prometheus Stats** - Prometheus 自身监控

## 🔧 故障排查

### 查看 Pod 状态
```bash
kubectl get pods -n monitoring
```

### 查看日志
```bash
kubectl logs -n monitoring <pod-name>
```

### 重启服务
```bash
kubectl rollout restart deployment -n monitoring
```

## 📚 更多资源

- [Helm 官方文档](https://helm.sh/docs/)
- [kube-prometheus-stack Chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
- [Grafana 文档](https://grafana.com/docs/)
- [Prometheus 文档](https://prometheus.io/docs/)

## 📝 License

MIT

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！
