package com.kh.drugstore.picked.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.picked.model.dto.PickedExtends;

@Mapper
public interface PickedDao {

	@Select("select * from (select row_number() over(partition by pcode order by pcode) as rn, p.* from (select pi.member_id, pro.pcode, pro.pname, pro.price, pro.discount, pa.original_filename, pa.renamed_filename from picked pi left join product pro on pi.pcode = pro.pcode left join product_attachment pa on pi.pcode = pa.pcode where pi.member_id = #{memberId})p) where rn = 1")
	List<PickedExtends> selectPickedList(String memberId);

	@Delete("delete from picked where member_id = #{memberId} and pcode = #{pcode}")
	int deletePickedList(Map<String, Object> map);

	@Insert("insert into picked values(#{memberId}, #{pcode})")
	int insertPickedList(Map<String, Object> map);


}
