#!/bin/bash
echo "📊 正在打开 Grafana..."
echo "浏览器访问: http://localhost:3000"
echo "用户名: admin / 密码: admin123"
echo ""
kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80
