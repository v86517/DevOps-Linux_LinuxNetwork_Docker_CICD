#!/bin/bash

URL="https://api.telegram.org/bot7324615808:AAES1FLNOXTTU2F6rU-tY4UzajZPzGeyF4o/sendMessage"
TEXT="Deploy status: $CI_JOB_NAME $CI_JOB_STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s --max-time 300 -d "chat_id=5484157606&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
