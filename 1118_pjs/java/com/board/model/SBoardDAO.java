package com.board.model;

import java.util.ArrayList;

public interface SBoardDAO {
	//추가
	public void boardInsert(BoardDTO board) ;
	//수정
	public void boardUpdate(BoardDTO board);
	//전체보기
	public ArrayList<BoardDTO> boardList();
	public ArrayList<BoardDTO> boaraList(int startRow, int endRow, String field, String word);
	//삭제
	public void boardDelete(int num);
	//게시글수
	public int boardCount(String field, String word);
	//상세보기
	public BoardDTO findByNum(int num);
	//---코멘트
	//코멘트 추가
	public void commentInsert(CommentDTO comment);
	//코멘트전체보기
	public ArrayList<CommentDTO> findAllComment(int bnum);
	//댓글개수(count) 
	public int commentCount(int bnum);
}
