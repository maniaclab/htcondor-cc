{{/*
Expand the name of the chart.
*/}}
{{- define "htcondor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "htcondor.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "htcondor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "htcondor.labels" -}}
helm.sh/chart: {{ include "htcondor.chart" . }}
{{ include "htcondor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "htcondor.labels.execute" -}}
helm.sh/chart: {{ include "htcondor.chart" . }}
{{ include "htcondor.selectorLabels.execute" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "htcondor.labels.cm" -}}
helm.sh/chart: {{ include "htcondor.chart" . }}
{{ include "htcondor.selectorLabels.cm" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "htcondor.labels.submit" -}}
helm.sh/chart: {{ include "htcondor.chart" . }}
{{ include "htcondor.selectorLabels.submit" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "htcondor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "htcondor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "htcondor.selectorLabels.execute" -}}
app.kubernetes.io/name: {{ include "htcondor.name" . }}-execute
app.kubernetes.io/instance: {{ .Release.Name }}-execute
{{- end }}

{{/*
Selector labels
*/}}
{{- define "htcondor.selectorLabels.cm" -}}
app.kubernetes.io/name: {{ include "htcondor.name" . }}-cm
app.kubernetes.io/instance: {{ .Release.Name }}-cm
{{- end }}

{{/*
Selector labels
*/}}
{{- define "htcondor.selectorLabels.submit" -}}
app.kubernetes.io/name: {{ include "htcondor.name" . }}-submit
app.kubernetes.io/instance: {{ .Release.Name }}-submit
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "htcondor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "htcondor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
