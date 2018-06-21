class ServiceTemplateBudgetWrapper
  def initialize(service_template)
    @service_template = service_template
  end

  # array of (cpu_total_cores, memory_mb, allocated_disk_storage)
  def metrics_by_service_template
    [[4, 1024, 17_179_869_184.0]]
  end

  def vms
    metrics_by_service_template.map do |cpu_total_cores, memory_mb, allocated_disk_storage|
      build_vm_by(cpu_total_cores, memory_mb, allocated_disk_storage)
    end
  end

  def build_vm_by(cpu_total_cores, memory_mb, allocated_disk_storage)
    vm = Vm.new
    vm.hardware = Hardware.new(:cpu_total_cores => cpu_total_cores, :memory_mb => memory_mb)
    disk = Disk.new(:size => allocated_disk_storage)
    vm.hardware.disks << disk
    vm
  end
end