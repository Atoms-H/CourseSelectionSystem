package bean;

public class Question {
    private int id; //智能沟通编号
    private String content; //问题内容
    private String answer; //回复内容

    public Question(){}
    public Question(int id, String content, String answer){
        this.id = id;
        this.content = content;
        this.answer = answer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
