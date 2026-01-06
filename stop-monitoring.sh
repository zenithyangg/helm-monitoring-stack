#!/bin/bash
echo "🛑 停止监控栈..."
helm uninstall monitoring -n monitoring
kubectl delete namespace monitoring
echo "✅ 已停止并清理"
