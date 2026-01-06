#!/bin/bash
echo "🚀 启动监控栈..."

# 检查是否已安装
if helm list -n monitoring | grep -q monitoring; then
    echo "✅ 监控栈已在运行"
else
    echo "📦 安装监控栈..."
    helm install monitoring prometheus-community/kube-prometheus-stack \
      -f monitoring-values.yaml \
      -n monitoring \
      --create-namespace
    
    echo "⏳ 等待服务就绪..."
    kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=grafana -n monitoring --timeout=300s
fi

echo ""
echo "✅ 监控栈运行中！"
echo ""
echo "📊 访问 Grafana:"
echo "   kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80"
echo "   http://localhost:3000"
echo "   用户名: admin / 密码: admin123"
echo ""
echo "🔍 访问 Prometheus:"
echo "   kubectl port-forward -n monitoring svc/monitoring-kube-prometheus-prometheus 9090:9090"
echo "   http://localhost:9090"
