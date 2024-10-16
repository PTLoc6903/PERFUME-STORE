/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoManager;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelManager.Perfume;


/**
 *
 * @author Admin
 */
public class PerfumeDAO extends DBContext {

    /**
     * Test function
     *
     * @param args
     */
    public static void main(String[] args) {
        PerfumeDAO f = new PerfumeDAO();
        // List<Perfume> Perfumes = f.searchByName("b");
//        for (int i = 0; i < Perfumes.size(); i++) {
//            System.out.println(Perfumes.get(i).toString());
//        }
    }

    /**
     * check Perfume is existed in Perfume table before
     *
     * @param id
     * @return
     */
    public boolean isExisted(String id) {
        try {
            String sql = "select * from Perfume  "
                    + "where per_id  = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * add Perfume to Perfume table
     *
     * @param Perfume
     */
    public void add(Perfume Perfume) {
        try {
            String sql = "insert into Perfume values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, Perfume.getId());
            ps.setString(2, Perfume.getCategoryId());
            ps.setString(3, Perfume.getName());
            ps.setDouble(4, Perfume.getPrice());
            ps.setDouble(5, Perfume.getSale());
            ps.setString(6, Perfume.getDescription());
            ps.setString(7, Perfume.getStatus());
            ps.setString(8, Perfume.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update Perfume which has before from Perfume table
     *
     * @param Perfume
     */
    public void update(Perfume Perfume) {
        try {
            String sql = "update Perfume set cat_id = ?, \n"
                    + "per_name = ?, \n"
                    + "per_price = ? , \n"
                    + "per_sale = ? , \n"
                    + "per_description =?, \n"
                    + "per_status = ?, \n"
                    + "per_img =? \n"
                    + "where per_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(8, Perfume.getId());
            ps.setString(1, Perfume.getCategoryId());
            ps.setString(2, Perfume.getName());
            ps.setDouble(3, Perfume.getPrice());
            ps.setDouble(4, Perfume.getSale());
            ps.setString(5, Perfume.getDescription());
            ps.setString(6, Perfume.getStatus());
            ps.setString(7, Perfume.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update Perfume status by id in Perfume table
     *
     * @param id
     * @param status
     */
    public void updateStatus(String id, String status) {
        try {
            String sql = "update Perfume set"
                    + "per_status = ?, "
                    + "where per_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(1, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * remove Perfume which has before from Perfume table
     *
     * @param id
     */
    public void remove(String id) {
        try {
            String sql = "delete Employee where per_id  = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * get all Perfume from Perfume table
     *
     * @return
     */
    public List<Perfume> getAll() {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search Perfume by name from Perfume table
     *
     * @param name
     * @return
     */
    public List<Perfume> searchByName(String name) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume  where per_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search by cateID from Perfume table
     *
     * @param cateID
     * @return
     */
    public List<Perfume> searchByCateID(String cateID) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume  where cat_id = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Perfume getPerfumeDetails(String id) {
        try {
            String sql = "SELECT f.per_id, f.per_name, f.per_price, f.per_sale, f.per_description, f.per_status, f.per_img, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered, c.cat_name, c.cat_id\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "LEFT JOIN Category c ON f.cat_id = c.cat_id\n"
                    + "where f.per_id = ?\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_price, f.per_sale, f.per_description, f.per_status, f.per_img, c.cat_name, c.cat_id";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getIDForNewPerfume() {
        try {
            String maxID;
            String sql = "select max(per_id) from Perfume";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            maxID = rs.getString(1);
            String prefix = maxID.substring(0, 4); // "FOOD"
            String numberPart = maxID.substring(4); // "016"
            int number = Integer.parseInt(numberPart); // 16
            number++; // Tăng giá trị lên một đơn vị
            String newID = prefix + String.format("%03d", number); // "FOOD017"
            return newID;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Perfume> getListBestSeller() {
        try {
            List<Perfume> listBestSeller = new ArrayList<>();
            String sql = "SELECT TOP 8 f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.per_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "WHERE f.per_status != 'Deleted'\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_price, f.per_sale, f.per_img, f.per_status\n"
                    + "ORDER BY total_quantity_ordered DESC;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listBestSeller.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return listBestSeller;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Perfume> getListMenu() {
        try {
            List<Perfume> listMenu = new ArrayList<>();
            String sql = "SELECT f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.cat_id, f.per_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "WHERE f.per_status != 'Deleted'\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.cat_id, f.per_status";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listMenu.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
            return listMenu;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Perfume> getListSuggest(String cateId) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "SELECT top(4) f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.per_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "WHERE f.cat_id = ? AND f.per_status != 'Deleted'\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_price, f.per_sale, f.per_img, f.per_status\n"
                    + "order by(total_quantity_ordered) desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deletePerfume(String PerfumeId) {
        try {
            String sql = "update Perfume set per_status = 'Deleted' where per_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, PerfumeId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Perfume getPerfumeUpdate(String id) {
        try {
            String sql = "select a.per_id, a.per_name, a.per_price, a.per_sale, a.per_description, a.per_status, a.per_img, b.cat_name, b.cat_id from Perfume a\n"
                    + "join Category b on a.cat_id=b.cat_id\n"
                    + "where per_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePerfume(Perfume Perfume) {
        try {
            String sql = "UPDATE Perfume\n"
                    + "SET cat_id = ?, \n"
                    + "    per_name = ?, \n"
                    + "    per_price = ?, \n"
                    + "    per_sale = ?,  \n"
                    + "    per_description = ?,\n"
                    + "    per_status = ?,\n"
                    + "    per_img = ? \n"
                    + "WHERE per_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(8, Perfume.getId());
            ps.setString(1, Perfume.getCategoryId());
            ps.setString(2, Perfume.getName());
            ps.setDouble(3, Perfume.getPrice());
            ps.setDouble(4, Perfume.getSale());
            ps.setString(5, Perfume.getDescription());
            ps.setString(6, Perfume.getStatus());
            ps.setString(7, Perfume.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
