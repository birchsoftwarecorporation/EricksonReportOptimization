# Look up lot by builder/tract/log
select 
	ROUND(e.calc_percentage, 2) as calc,
	ROUND(e.claim_percentage, 2) as claim,
	e.hours as hours,
	e.labor_claim as labor_claim,
	e.labor_cost as labor_cost,
	e.progress_date as date,
	e.type as type,
	f.name as foreman,
	ROUND(l.field_budget, 2) as field_budget,
	ROUND(l.panel_budget, 2) as panel_budget,
	l.number as lot,
	t.name as tract,
	b.code as builder
from entry e 
left join lot l on l.id = e.lot_id
left join tract t on t.id = l.tract_id
left join builder b on b.id = t.builder_id
left join foreman f on f.id = e.foreman_id
where b.code = "DRH"
and t.name = "HSP24"
and l.number = 61
order by date