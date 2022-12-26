package com.myspring.model;

import java.util.HashMap;
import java.util.List;

public interface GuestDAO {
	//�߰�
	public void dao_guestInsert(String mid, GuestDTO guest);
	//��ü����
	public List<GuestDTO> dao_guestList(HashMap<String, String> hm);
	//ī��Ʈ
	public int dao_guestCount(HashMap<String, String> hm);
}
