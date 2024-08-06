{{/*
Expand the name of the chart.
*/}}
{{- define "master.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-master" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-master" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "master.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-master" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name }}
{{- printf "%s-master" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s-master" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "master.chart" -}}
{{- printf "%s-master-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "master.labels" -}}
role: {{ include "master.name" . }}
app: {{ include "master.name" . }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "slave.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-slave" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-slave" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "slave.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-slave" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name }}
{{- printf "%s-slave" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s-slave" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "slave.chart" -}}
{{- printf "%s-slave-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "slave.labels" -}}
role: {{ include "slave.name" . }}
app: {{ include "slave.name" . }}
{{- end }}
