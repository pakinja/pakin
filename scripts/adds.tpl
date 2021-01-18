{% extends '/home/pakin/anaconda3/pkgs/nbconvert-5.4.0-py37_1/lib/python3.7/site-packages/nbconvert/templates/python.tpl' %}

## change the appearance of execution count
{% block in_prompt %}
# This was input cell with execution count: {{ cell.execution_count if cell.execution_count else ' ' }}
{%- endblock in_prompt %}
