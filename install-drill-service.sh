tee /etc/systemd/system/apache-drill.service << EOF
[Unit]
Description=Apache Drill Daemon
Documentation=https://drill.apache.org/
Requires=network.target
After=network.target

[Service]
Type=forking
WorkingDirectory=/opt/drill/

User=root
Group=root

ExecStart=/opt/drill/bin/drillbit.sh  --config /opt/drill-site/ start
ExecStop=/opt/drill/bin/drillbit.sh  --config /opt/drill-site/ stop
ExecReload=/opt/drill/bin/drillbit.sh  --config /opt/drill-site/ restart
TimeoutSec=30
Restart=on-failure
[Install]
WantedBy=default.target
EOF


systemctl daemon-reload
systemctl start apache-drill
systemctl enable apache-drill
systemctl status apache-drill
