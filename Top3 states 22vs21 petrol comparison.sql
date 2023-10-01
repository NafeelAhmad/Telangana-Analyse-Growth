
Create Temporary Table P_22
select district,sum(fuel_type_petrol) fuel_type_petrol_2022 from dim_district d join fact_transport f 
using(dist_code) join dim_date m using(month) where Fiscal_year=2022 
group by district order by fuel_type_petrol_2022 desc ;

Create Temporary Table P_21
select district,sum(fuel_type_petrol) fuel_type_petrol_2021 from dim_district d join fact_transport f 
using(dist_code) join dim_date m using(month) where Fiscal_year=2021 
group by district order by fuel_type_petrol_2021 desc;

SELECT *,round((fuel_type_petrol_2022/fuel_type_petrol_2021)*100,2) P22_vs_21 
FROM P_22 join P_21 using(district) order by P22_vs_21 desc limit 3