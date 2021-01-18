#!/bin/bash

#today = date + '%Y-%m-%d %H:%M'
#sed -i "/.*\"dateModified\".*/c\\"dateModified\": $today/" /home/pakin/Documents/desarrolloWeb/PakinV4/me/lab-python/chispazo.html


#sed 's/.*"dateModified":.*/"dateModified": "'$(date '+%Y-%m-%d %H:%M')'",/' /home/pakin/Documents/desarrolloWeb/PakinV4/me/lab-python/chispazo.html

d="`date '+%Y-%m-%d %H:%M'`";sed -Ei "s/(.*\"dateModified\": ).*/\1\"$d\",/i" /home/pakin/Documents/desarrolloWeb/PakinV4/me/lab-python/chispazo.html


# Define a timestamp function
# date  '+%Y-%m-%d %H:%M'
