{{- define "rakbank.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "rakbank.name" -}}
{{- printf "%s" .Release.Name -}}
{{- end }}

{{- define "rakbank.labels" -}}
helm.sh/chart: {{ include "rakbank.chart" . }}
{{ include "rakbank.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "rakbank.chart" -}}
{{- .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}

{{- define "rakbank.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rakbank.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
