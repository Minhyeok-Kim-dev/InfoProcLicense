package com.mink.license.model.dto;

/** 기술용어, 전산영어 dto
 * @author Minhyeok Kim
 * @written 2018. 3. 28.
 */
public class Term {
	private int sec;
	private int seq;
	private String shortNm;
	private String fullNm;
	private String korNm;
	private String contents;
	
	public int getSec() {
		return sec;
	}
	public void setSec(int sec) {
		this.sec = sec;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getShortNm() {
		return shortNm;
	}
	public void setShortNm(String shortNm) {
		this.shortNm = shortNm;
	}
	public String getFullNm() {
		return fullNm;
	}
	public void setFullNm(String fullNm) {
		this.fullNm = fullNm;
	}
	public String getKorNm() {
		return korNm;
	}
	public void setKorNm(String korNm) {
		this.korNm = korNm;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "Term [sec=" + sec + ", seq=" + seq + ", shortNm=" + shortNm + ", fullNm=" + fullNm + ", korNm=" + korNm
				+ ", contents=" + contents + "]";
	}
}
