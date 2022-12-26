package com.myspring.model;

import java.util.HashMap;
import java.util.List;

public interface GuestDAO {
	//추가
	public void dao_guestInsert(String mid, GuestDTO guest);
	//전체보기
	public List<GuestDTO> dao_guestList(HashMap<String, String> hm);
	//카운트
	public int dao_guestCount(HashMap<String, String> hm);
}
