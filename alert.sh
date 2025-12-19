
#!/usr/bin/env bash
hostname="test.mon.dvag.com"
# interne URL
#url="http://alertmanager-test.mon.dvag.net/api/v1/alerts"
#url="http://localhost:8080/incoming"
url="http://localhost:9093/api/v2/alerts"
# externe URL
#url="https://pushgw.dvag.com/metrics/job/pushgateway/instance/${hostname}"
# Test
# Auth_User='pushgw-test'
# Auth_Token='xxx'
generate_post_data=$(cat <<'EOF'
[
  {
    "labels": {
      "alertname": "newsystem_test_aler0t",
      "activated": "true",
      "alert_scc": "true",
      "check_type": "multi_step",
      "environment": "Abnahme",
      "group": "DFS / KP-API / Abnahme",
      "jira_project": "DFSKUPO",
      "job": "checkly_dvag_monitoring",
      "leanix_app_id": "APP-00564",
      "muted": "false",
      "name": "KP / Check Product Positive Flow",
      "platform": "checkly",
      "check_id":"11400f73-715e-42ef-a1c0-1e32e37e5e75",
      "product": "ClientPortal",
      "severity": "error",
      "status": "failing",
      "test": "true"
    },
    "annotations": {
      "description": "This ist Yet Another Test.",
      "update_me": "ewrayes2jk",
      "summary": "Yet Another Test",
      "ncheine": "abstand",
      "metric_name": "fail"
    },
    "generatorURL": "https://prometheus.mon.cloud.dvag/graph?g0.expr:dvag_e2e_availability%7Binstance%3D%22dvag.produktion.uinfo.smokeTestMeineDvag.selenide%22%2Cjob%3D%22aktives-monitoring%22%7D+%3C%3D+80&g0.tab:1"
  }
]
EOF
)
#echo $generate_post_data


curl -v $url --data "$generate_post_data" \
  -H "Content-Type: application/json"
  # -H "Auth-User: $Auth_User" \
  # -H "Auth-Token: $Auth_Token" \
  #--trace-ascii /dev/stdout

