select r.name as region, b.code as builder, t.name as tract, l.number as lot,
	# ( (Percent complete) * (Panel Cost) ) - (Date Labor cost) 
(ROUND((week1.percent_complete * week1.cost) - week1.labor_cost, 2)) as week1,
(ROUND((week2.percent_complete * week2.cost) - week2.labor_cost, 2)) as week2,
(ROUND((week3.percent_complete * week3.cost) - week3.labor_cost, 2)) as week3,
(ROUND((week4.percent_complete * week4.cost) - week4.labor_cost, 2)) as week4,
(ROUND((week5.percent_complete * week5.cost) - week5.labor_cost, 2)) as week5,
(ROUND((week6.percent_complete * week6.cost) - week6.labor_cost, 2)) as week6,
(ROUND((week7.percent_complete * week7.cost) - week7.labor_cost, 2)) as week7,
(ROUND((week8.percent_complete * week8.cost) - week8.labor_cost, 2)) as week8,
(ROUND((week9.percent_complete * week9.cost) - week9.labor_cost, 2)) as week9,
(ROUND((week10.percent_complete * week10.cost) - week10.labor_cost, 2)) as week10
from region r
left join region_builder rb on r.id = rb.region_id
left join builder b on b.id = rb.builder_id
left join tract t on t.builder_id = b.id	
left join lot l on l.tract_id = t.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 1 WEEK), INTERVAL 1 DAY) AND CAST(${start_date} as date) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week1 on week1.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 2 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 1 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week2 on week2.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 3 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 2 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week3 on week3.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 4 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 3 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week4 on week4.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 5 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 4 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week5 on week5.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 6 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 5 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week6 on week6.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 7 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 6 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week7 on week7.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 8 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 7 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week8 on week8.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 9 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 8 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week9 on week9.lot_id = l.id
left join 
(
	select 
		# Sum percent complete
		COALESCE(SUM(e.claim_percentage), 0)+COALESCE(SUM(e.calc_percentage),0) as percent_complete,
		# Panel/Field cost
		#(case when type = "Field" then ROUND(l.field_budget, 2) else ROUND(l.panel_budget, 2) end) as cost,
		(case when type = "Field" then l.field_budget else l.panel_budget end) as cost,
		# Sum labor cost by date
		COALESCE(SUM(e.labor_cost),0) as labor_cost, 
		e.progress_date as date, 
		e.type as type, 
		f.name as foreman, 
		e.lot_id,
		l.number as lot,
		t.name as tract,
		b.code as builder
	from entry e 
		left join lot l on l.id = e.lot_id
		left join tract t on t.id = l.tract_id
		left join builder b on b.id = t.builder_id
		left join foreman f on f.id = e.foreman_id	
		left join region_builder rb on b.id = rb.builder_id
		left join region r on r.id = rb.region_id	
	where 
		#f.name = "GARCIA, WILFRIDO" and 
		r.name = ${region}
		and (progress_date BETWEEN  DATE_ADD(DATE_SUB(${start_date}, INTERVAL 10 WEEK), INTERVAL 1 DAY) AND DATE_SUB(${start_date}, INTERVAL 9 WEEK) )
		#and b.code = "AVH"
		#and t.name = "MR"
		#and l.number = 124
	group by tract, builder, lot, date
) week10 on week10.lot_id = l.id
where r.name = ${region}
order by region, builder, tract, lot
