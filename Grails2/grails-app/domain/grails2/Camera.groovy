package grails2

class Camera {

    String name
    String serial
    Date purchageDate

    static constraints = {

    }


    String toString() {
        return name;
    }
}
