//package org.example.sosweb.tablemodel;
//
//import org.example.sosweb.model.OrdensServico;
//
//import javax.swing.table.AbstractTableModel;
//import java.text.DecimalFormat;
//import java.text.DecimalFormatSymbols;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Locale;
//
//public class OrdemClienteTableModel extends AbstractTableModel {
//
//    private List<OrdensServico> listaOrdens;
//    private String[] colunas = {"OSID", "CID", "Cliente", "Descrição", "Desconto", "Extras", "Valor Total", "Status"};
//
//    public OrdemClienteTableModel() {
//        listaOrdens = new ArrayList<>();
//    }
//
//    public OrdemClienteTableModel(List<OrdensServico> oc) {
//        this();
//        this.listaOrdens.addAll(oc);
//    }
//
//    @Override
//    public int getRowCount() {
//        return listaOrdens.size();
//    }
//
//    @Override
//    public int getColumnCount() {
//        return colunas.length;
//    }
//
//    @Override
//    public Object getValueAt(int linha, int coluna) {
//        OrdensServico oc = listaOrdens.get(linha);
//        switch (coluna) {
//            case 0: return oc.getOsid();
//            case 1: return oc.getCliente().getIdcliente();
//            case 2: return oc.getCliente().getNome();
//            case 3: return oc.getDesc();
//            case 4: return formatarValor(oc.getDesconto());
//            case 5: return formatarValor(oc.getExtras());
//            case 6: return formatarValor(oc.getTotal());
//            case 7: return oc.getStatus();
//            default: return "";
//        }
//    }
//
//    @Override
//    public String getColumnName(int column) {
//        return colunas[column];
//    }
//
//    private String formatarValor(double valor) {
//        DecimalFormat formatar = new DecimalFormat("#,##0.00", new DecimalFormatSymbols(Locale.US));
//        return formatar.format(valor);
//    }
//
//    public OrdensServico getOrdens(int linha) {
//        if (linha >= listaOrdens.size()) {
//            return null;
//        }
//        return listaOrdens.get(linha);
//    }
//}