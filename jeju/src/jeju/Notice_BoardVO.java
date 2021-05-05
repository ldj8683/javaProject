package jeju;

public class Notice_BoardVO {// 공지사항 테이블에 있는 각 컬럼값을 스트링 변수로 선언!
	int no;
	String title;
	String date;
	String writer;
	String file;
	String content;

	// 넣고 넣는 메서드 생성(소스 -> 제너레이트 겟터 앤 셋터)
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
