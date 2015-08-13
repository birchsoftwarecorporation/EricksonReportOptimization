select r.name as region, b.code as builder, t.name as tract, l.number as lot,  COALESCE(week1.foreman, week2.foreman, week3.foreman, week4.foreman, week5.foreman, week6.foreman, week7.foreman, week8.foreman, week9.foreman, week10.foreman) as foreman, 
ROUND((COALESCE(week1.claim_percentage, week1.calc_percentage)*field_budget)-week1.labor_cost, 2) as week1,
ROUND((COALESCE(week2.claim_percentage, week2.calc_percentage)*field_budget)-week2.labor_cost, 2) as week2,
ROUND((COALESCE(week3.claim_percentage, week3.calc_percentage)*field_budget)-week3.labor_cost, 2) as week3,
ROUND((COALESCE(week4.claim_percentage, week4.calc_percentage)*field_budget)-week4.labor_cost, 2) as week4,
ROUND((COALESCE(week5.claim_percentage, week5.calc_percentage)*field_budget)-week5.labor_cost, 2) as week5,
ROUND((COALESCE(week6.claim_percentage, week6.calc_percentage)*field_budget)-week6.labor_cost, 2) as week6,
ROUND((COALESCE(week7.claim_percentage, week7.calc_percentage)*field_budget)-week7.labor_cost, 2) as week7,
ROUND((COALESCE(week8.claim_percentage, week8.calc_percentage)*field_budget)-week8.labor_cost, 2) as week8,
ROUND((COALESCE(week9.claim_percentage, week9.calc_percentage)*field_budget)-week9.labor_cost, 2) as week9,
ROUND((COALESCE(week10.claim_percentage, week10.calc_percentage)*field_budget)-week10.labor_cost, 2) as week10
from region r
left join region_builder rb on r.id = rb.region_id
left join builder b on b.id = rb.builder_id
left join tract t on t.builder_id = b.id	
left join lot l on l.tract_id = t.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 1 WEEK), INTERVAL 1 DAY) AND CAST('2015-07-04' as date) )
) week1 on week1.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 2 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 1 WEEK) )
) week2 on week2.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 3 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 2 WEEK) )
) week3 on week3.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 4 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 3 WEEK) )
) week4 on week4.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 5 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 4 WEEK) )
) week5 on week5.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 6 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 5 WEEK) )
) week6 on week6.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 7 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 6 WEEK) )
) week7 on week7.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 8 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 7 WEEK) )
) week8 on week8.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 9 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 8 WEEK) )
) week9 on week9.lot_id = l.id
left join 
(
	select e.calc_percentage as calc_percentage, e.claim_percentage as claim_percentage, e.hours as hours, e.labor_claim as labor_claim, e.labor_cost as labor_cost, e.progress_date as date, e.type as type, f.name as foreman, e.lot_id
	from entry e
	left join foreman f on f.id = e.foreman_id
	where f.name = "ACUNA NEVAREZ, O" and (progress_date BETWEEN  DATE_ADD(DATE_SUB('2015-07-04', INTERVAL 10 WEEK), INTERVAL 1 DAY) AND DATE_SUB('2015-07-04', INTERVAL 9 WEEK) )
) week10 on week10.lot_id = l.id
where week1.foreman = "ACUNA NEVAREZ, O" or 
week2.foreman = "ACUNA NEVAREZ, O" or 
week3.foreman = "ACUNA NEVAREZ, O" or 
week4.foreman = "ACUNA NEVAREZ, O" or 
week5.foreman = "ACUNA NEVAREZ, O" or 
week6.foreman = "ACUNA NEVAREZ, O" or 
week7.foreman = "ACUNA NEVAREZ, O" or  
week8.foreman = "ACUNA NEVAREZ, O" or 
week9.foreman = "ACUNA NEVAREZ, O" or 
week10.foreman = "ACUNA NEVAREZ, O"