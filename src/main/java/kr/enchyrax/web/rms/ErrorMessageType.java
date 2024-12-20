package kr.enchyrax.web.rms;

public enum ErrorMessageType {

    NONE(""),
    LOGIN_FAILED("아이디 또는 비밀번호가 일치하지 않습니다."),
    INTERNAL_ERROR("예기치 않은 오류. 관리자에게 문의하세요."),
    ID_ALREADY_EXISTS("이미 존재하는 아이디입니다."),
    ID_OVER_MAX_LENGTH("아이디는 최대 20자까지 설정 가능합니다."),
    PASSWORD_OVER_MAX_LENGTH("비밀번호는 최대 20자까지 설정 가능합니다."),
    NICKNAME_OVER_MAX_LENGTH("별명은 최대 20자까지 설정 가능합니다."),
    MAJOR_OVER_MAX_LENGTH("전공은 최대 10자까지 설정 가능합니다."),
    PASSWORD_INCORRECT("비밀번호가 일치하지 않습니다."),
    TITLE_OVER_MAX_LENGTH("연구 제목은 최대 255자까지 설정 가능합니다."),
    TITLE_ALREADY_EXISTS("이미 존재하는 연구 제목입니다."),
    MODEL_NAME_OVER_MAX_LENGTH("");

    private final String message;

    ErrorMessageType(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
