select 
  PA.part,
  PA.assembly_step
from parts_assembly as PA
where PA.finish_date is null;