--	Giá trung bình của vật nuôi có mang giống American Shorthair.
select AVG(fee)
from petFACT p
join typeDIM t
on p.typeKey = t.typeKey
where (t.breed1 = N'American Shorthair' or t.breed2 = N'American Shorthair') 
and p.fee > 0 and p.endDate is NULL



--	Số lượng vật nuôi chưa được tẩy giun và chưa được tiêm phòng.
select sum(p.quantity)
from petFACT p
join healthDIM h
on p.healthKey = h.healthKey
where h.vaccinated = N'No' and h.dewormed = N'No' and p.endDate is NULL



--	Top 10 vật nuôi kích thước nhỏ có giá mắc nhất

select *
from typeDIM t,
	(select top 10 p.fee, p.typeKey, a.*
	from petFACT p, 
		(select *
		from appearanceDIM
		where MaturitySize = N'Small') a
	where p.appearanceKey = a.appearanceKey and p.endDate is NULL
	order by p.fee desc) p
where t.typeKey = p.typeKey