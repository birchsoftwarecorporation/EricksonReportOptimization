select r.name as region, b.code as builder, t.name as tract, l.number as lot, 
COALESCE(week1.foreman, week2.foreman, week3.foreman, week4.foreman, week5.foreman, week6.foreman, week7.foreman, week8.foreman, week9.foreman, week10.foreman) as foreman, 
ROUND((week1.percentage*
	case when week1.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week1.labor_cost, 2) as week1,
ROUND((week2.percentage*
	case when week2.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week2.labor_cost, 2) as week2,
ROUND((week3.percentage*
	case when week3.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week3.labor_cost, 2) as week3,
ROUND((week4.percentage*
	case when week4.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week4.labor_cost, 2) as week4,
ROUND((week5.percentage*
	case when week5.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week5.labor_cost, 2) as week5,
ROUND((week6.percentage*
	case when week6.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week6.labor_cost, 2) as week6,
ROUND((week7.percentage*
	case when week7.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week7.labor_cost, 2) as week7,
ROUND((week8.percentage*
	case when week8.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week8.labor_cost, 2) as week8,
ROUND((week9.percentage*
	case when week9.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week9.labor_cost, 2) as week9,
ROUND((week10.percentage*
	case when week10.type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end)-week10.labor_cost, 2) as week10
from region r
left join region_builder rb on r.id = rb.region_id
left join builder b on b.id = rb.builder_id
left join tract t on t.builder_id = b.id	
left join lot l on l.tract_id = t.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 1 WEEK), INTERVAL 1 DAY) AND CAST('2015-08-08' as date) )
	group by tract, builder, lot, date

) week1 on week1.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 2 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 1 WEEK) )
	group by tract, builder, lot, date
) week2 on week2.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 3 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 2 WEEK) )
	group by tract, builder, lot, date
) week3 on week3.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and 
		r.name = "AZF" and 
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 4 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 3 WEEK) )
	group by tract, builder, lot, date	
) week4 on week4.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 5 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 4 WEEK) )
	group by tract, builder, lot, date		
) week5 on week5.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 6 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 5 WEEK) )
	group by tract, builder, lot, date			
) week6 on week6.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 7 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 6 WEEK) )
	group by tract, builder, lot, date	
) week7 on week7.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 8 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 7 WEEK) )
	group by tract, builder, lot, date	
) week8 on week8.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 9 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 8 WEEK) )
	group by tract, builder, lot, date	
) week9 on week9.lot_id = l.id
left join 
(
	select 
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percentage,
		e.hours as hours, 
		e.labor_claim as labor_claim, 
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		l.field_budget as field_budget,
		l.panel_budget as panel_budget,
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder,
		r.name as region
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		f.name = "GARCIA, WILFRIDO" and  
		r.name = "AZF" and
		(progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-08-08', INTERVAL 10 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-08-08', INTERVAL 9 WEEK) )
	group by tract, builder, lot, date	
) week10 on week10.lot_id = l.id
where week1.foreman = "GARCIA, WILFRIDO" or 
week2.foreman = "GARCIA, WILFRIDO" or 
week3.foreman = "GARCIA, WILFRIDO" or 
week4.foreman = "GARCIA, WILFRIDO" or 
week5.foreman = "GARCIA, WILFRIDO" or 
week6.foreman = "GARCIA, WILFRIDO" or 
week7.foreman = "GARCIA, WILFRIDO" or  
week8.foreman = "GARCIA, WILFRIDO" or 
week9.foreman = "GARCIA, WILFRIDO" or 
week10.foreman = "GARCIA, WILFRIDO"