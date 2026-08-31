report 60149 "Peralatan List Report"
{
    Caption = 'Peralatan List Report';
    UsageCategory = ReportsAndAnalysis;                     // Optional
    ApplicationArea = All;
    DefaultLayout = RDLC;                                   // Jika ingin excel , pilih opsi excel
    RDLCLayout = './layouts/PeralatanList.rdl';             // Jika ingin excel , pakai extension .xlsx. Sesuaikan dengan directory dimana report mau disimpan

    dataset
    {
        dataitem(Peralatan; Peralatan)
        {
            RequestFilterFields = "Kondisi";

            column(NoAset; "No Aset") { }
            column(NamaBarang; "Nama Barang") { }
            column(TanggalPembelian; "Tanggal Pembelian") { }
            column(Kondisi; Kondisi) { }
            column(HargaBeli; "Harga Beli") { }
            column(TotalHargaBeli; TotalHarga) { }

            trigger OnAfterGetRecord()
            begin
                TotalHarga += "Harga Beli";
            end;

            trigger OnPreDataItem()
            begin
                if HanyaRusak then
                    SetFilter(Kondisi, '%1|%2', Kondisi::"Rusak Ringan", Kondisi::"Rusak Berat");
            end;
        }
    }

    // Ketika ingin menampilkan report, user dapat melihat list apa saja yang dapat dilakukan pada request page, request page berfungsi sebagai tempat untuk apply "filter"
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Opsi Laporan';

                    field(HanyaRusakField; HanyaRusak)
                    {
                        ApplicationArea = All;
                        Caption = 'Hanya Tampilkan yang Rusak';
                        ToolTip = 'Jika dicentang, hanya peralatan dengan kondisi rusak yang ditampilkan.';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        TotalHarga: Decimal;
        HanyaRusak: Boolean;
}



/*

    Dalam rdl, user dapat melakukan :

    1. Dynamic tables/Tablix — grouping rows (e.g., group Peralatan rows by Kondisi), sorting, subtotal rows

    2. Header/Footer bands — page numbers, logo perusahaan (biasanya CompanyLogo, blob field, or a static image), judul report

    3. Conditional formatting — e.g., highlight rows where Kondisi = Rusak Berat in red

*/
