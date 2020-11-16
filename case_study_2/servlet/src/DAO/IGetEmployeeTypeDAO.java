package DAO;

import models.Division;
import models.EducationDegree;
import models.Position;
import models.UserType;

import java.util.List;

public interface IGetEmployeeTypeDAO {
    String jdbcURL = "jdbc:mysql://localhost:3306/casestudy2?useSSL=false";
    String jdbcUsername = "root";
    String jdbcPassword = "Chewingum1";

    List<Position> getPositionList();
    List<Division> getDivisionList();
    List<EducationDegree> getEducationDegreeList();
    List<UserType> getUserTypeList();
}
