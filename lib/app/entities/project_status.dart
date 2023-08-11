enum ProjectStatus {
  emAndamento(label: 'Em Andamento'),
  finalizado(label: 'Finalizado');

  final String label;

  const ProjectStatus({required this.label});
}
