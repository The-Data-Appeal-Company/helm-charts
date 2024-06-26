{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "trino.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "trino.fullname" -}}
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
{{- define "trino.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "trino.coordinator" -}}
{{ template "trino.fullname" . }}-coordinator
{{- end -}}

{{- define "trino.coordinator.svcName" -}}
{{ template "trino.coordinator" . }}-headless
{{- end -}}

{{- define "trino.worker" -}}
{{ template "trino.fullname" . }}-worker
{{- end -}}

{{- define "trino.worker.svcName" -}}
{{ template "trino.worker" . }}-headless
{{- end -}}

{{- define "trino.connectors" -}}
{{ template "trino.fullname" . }}-connectors
{{- end -}}

{{- define "trino.jmx-exporter" -}}
{{ template "trino.fullname" . }}-jmx-exporter
{{- end -}}
