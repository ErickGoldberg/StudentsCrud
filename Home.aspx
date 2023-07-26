<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentsCrud.Home" MasterPageFile="~/Master/MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <h1 class="text-center" style="margin-top: 30px;">Students Crud</h1>

    <main>
        <div>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="float: right; margin-right:10%; margin-bottom:15px;  position:relative;">
                Adicionar
            </button>
        </div>


        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">New Student</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="nome">Name:</label>
                                <input type="text" class="form-control" id="txtName" placeholder="Cleiton Costa" required pattern="[A-Za-z\s]+" runat="server">
                            </div>
                            <div class="form-group">
                                <label for="nota1">Grade 1:</label>
                                <input type="number" class="form-control" id="txtGrade1" min="0" max="10" placeholder="9.0" required runat="server">
                            </div>
                            <div class="form-group">
                                <label for="nota2">Grade 2:</label>
                                <input type="number" id="txtGrade2" class="form-control" min="0" max="10" placeholder="7.5" runat="server">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="ButtonAdd" class="btn btn-primary" OnClick="ButtonAdd_Click" runat="server" Text="Add" />
                    </div>
                </div>
            </div>
        </div>

        <asp:GridView ID="studentTable" runat="server" CssClass="table table-striped" style="width:80%; margin: 4% 10%;" AutoGenerateColumns="false" OnRowEditing="studentTable_RowEditing" OnRowDeleting="studentTable_RowDeleting">
            <Columns>
                <asp:BoundField HeaderText="Name" DataField="Name" />
                <asp:BoundField HeaderText="Grade 1" DataField="Grade1" />
                <asp:BoundField HeaderText="Grade 2" DataField="Grade2" />
                <asp:BoundField HeaderText="Average" DataField="Average" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <!-- Ícones de editar e excluir -->
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' ToolTip="Edit">
                    <i class="fa fa-pencil" ></i>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' ToolTip="Delete">
                    <i class="fa fa-trash" style="color: red"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </main>

</asp:Content>
