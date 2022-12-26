package com.board.model;

import java.util.ArrayList;

public interface SBoardDAO {
	//�߰�
	public void boardInsert(BoardDTO board) ;
	//����
	public void boardUpdate(BoardDTO board);
	//��ü����
	public ArrayList<BoardDTO> boardList();
	public ArrayList<BoardDTO> boaraList(int startRow, int endRow, String field, String word);
	//����
	public void boardDelete(int num);
	//�Խñۼ�
	public int boardCount(String field, String word);
	//�󼼺���
	public BoardDTO findByNum(int num);
	//---�ڸ�Ʈ
	//�ڸ�Ʈ �߰�
	public void commentInsert(CommentDTO comment);
	//�ڸ�Ʈ��ü����
	public ArrayList<CommentDTO> findAllComment(int bnum);
	//��۰���(count) 
	public int commentCount(int bnum);
}
