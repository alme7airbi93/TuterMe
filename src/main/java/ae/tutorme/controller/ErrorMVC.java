package ae.tutorme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by almehairbi on 5/3/17.
 */

@Controller
public class ErrorMVC {


    @RequestMapping(value = "errors", method = RequestMethod.GET)
    public String renderErrorPage(HttpServletRequest httpRequest) {


        int httpErrorCode = getErrorCode(httpRequest);
        String error = "404";
        switch (httpErrorCode) {
            case 400: {
                error = "404";
                break;
            }
            case 401: {
                error = "404";
                break;
            }
            case 404: {
                error = "404";
                break;
            }
            case 500: {
                error = "500";
                break;
            }case 403:
                {
                    error = "404";
                break;
            }
            default:
                error = "404";
                break;
        }

        return error;

    }

    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
                .getAttribute("javax.servlet.error.status_code");
    }
}
