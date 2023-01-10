tee /etc/systemd/system/apache-drill.service << EOF
[Unit]
Description=Apache Drill Daemon
Documentation=https://drill.apache.org/
Requires=network.target
After=network.target

[Service]    
Type=forking
WorkingDirectory=/opt/drill
User=root
Group=root
ExecStart=/opt/drill/ibin/drillbit.sh start --config /opt/drill-site/drill-override.conf
ExecStop=/opt/drill/ibin/drillbit.sh stop --config /opt/drill-site/drill-override.conf
ExecReload=/opt/drill/ibin/drillbit.sh restart --config /opt/drill-site/drill-override.conf
TimeoutSec=30
Restart=on-failure
[Install]
WantedBy=default.target
EOF


systemctl daemon-reload
systemctl start apache-drill
systemctl enable apache-drill
systemctl status apache-drill
