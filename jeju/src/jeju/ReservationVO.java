package jeju;
//VO: 계층간 데이터 교환을 위한 객체 -> DB의 데이터를 서비스나 컨트롤러 등으로 보낼 때 사용하는 객체
//VO만들기(데이터를 담아줄 가방과 같은 역할) => 가방을 하나 만들어서 값을 넣은 다음에 한 번에 넘기는게 더 효율적
//데이터 베이스로 보내기 위해 데이터를 보관해주는 부분
//source -> generate getter and setter 사용!!!

//값을 넣고 뺄때는 변수 하나씩 기능을 처리
//각 변수마다 넣는기능, 꺼내는 기능 필요
//기능은 메서드로 구현

public class ReservationVO {
	
	int res_num;
	String res_id;
    String res_name;
    String res_tel;
    String res_date;
    String res_payment;
    String res_room;
    int res_cost;
    
    
  //this = MemberVO라는 클래스 => this.res_id = 클래스 아래있는 멤버변수다!!  
  //res_id = res_id라고 하면 파라미터인 지역변수와 전역변수가 같아져서 문제생김 따라서 구분을 위해 this 사용(헷갈릴때사용)
    public int getRes_num() {
		return res_num;
	}
    public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getRes_id() {
		return res_id;
	}
	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getRes_tel() {
		return res_tel;
	}
	public void setRes_tel(String res_tel) {
		this.res_tel = res_tel;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getRes_payment() {
		return res_payment;
	}
	public void setRes_payment(String res_payment) {
		this.res_payment = res_payment;
	}
	public String getRes_room() {
		return res_room;
	}
	public void setRes_room(String res_room) {
		this.res_room = res_room;
	}
	public int getRes_cost() {
		return res_cost;
	}
	public void setRes_cost(int res_cost) {
		this.res_cost = res_cost;
	}
}