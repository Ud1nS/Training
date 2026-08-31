page 60149 "Peralatan List"
{
    PageType = List;
    SourceTable = Peralatan;
    Caption = 'Daftar Peralatan';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No Aset"; Rec."No Aset")
                {
                    ApplicationArea = All;
                    ToolTip = 'Masukkan nomor aset.';
                }
                field("Nama Barang"; Rec."Nama Barang")
                {
                    ApplicationArea = All;
                    ToolTip = 'Masukkan nama barang.';
                }
                field("Tanggal Pembelian"; Rec."Tanggal Pembelian")
                {
                    ApplicationArea = All;
                    ToolTip = 'Masukkan tanggal pembelian.';
                }
                field("Kondisi"; Rec."Kondisi")
                {
                    ApplicationArea = All;
                    ToolTip = 'Pilih kondisi barang.';
                }
                field("Harga Beli"; Rec."Harga Beli")
                {
                    ApplicationArea = All;
                    ToolTip = 'Masukkan harga beli.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TandaiRusak)
            {
                Caption = 'Tandai Rusak';
                Image = Comment;
                ToolTip = 'Tandai peralatan sebagai rusak ringan.';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Validate(Kondisi, Rec.Kondisi::"Rusak Ringan");
                    Rec.Modify(true);
                end;
            }
        }
    }
}