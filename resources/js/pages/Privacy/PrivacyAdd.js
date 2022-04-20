import React from "react";
import PageLayout from "../../layouts/PageLayout";
import {
    Breadcrumb,
    Button,
    Layout,
    PageHeader,
    Form,
    Spin,
    Radio,
    Select,
    message,
} from "antd";
import { CKEditor } from "@ckeditor/ckeditor5-react";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import languageActive from "../../requests/Language/LanguageActive";
import shopActive from "../../requests/Shops/ShopActive";
import { Link } from "react-router-dom";
import privacyGet from "../../requests/Privacy/PrivacyGet";
import privacySave from "../../requests/Privacy/PrivacySave";
import { withTranslation } from 'react-i18next';
import {IS_DEMO} from "../../global";

const { Content } = Layout;
const { Option } = Select;

class PrivacyAdd extends React.Component {
    formRef = React.createRef();

    state = {
        data: [],
        language: "en",
        languages: [],
        privacy: {},
        shops: [],
        id: 0,
    };

    constructor(props) {
        super(props);

        this.getActiveLanguages = this.getActiveLanguages.bind(this);
        this.onChangeLanguage = this.onChangeLanguage.bind(this);
        this.getActiveShops = this.getActiveShops.bind(this);
        this.onChangeContent = this.onChangeContent.bind(this);

        this.getActiveLanguages();
    }

    getActiveShops = async () => {
        let data = await shopActive();
        if (data.data.success == 1 && data.data.data.length > 0) {
            this.setState({
                shops: data.data.data,
            });

            this.formRef.current.setFieldsValue({
                shop: data.data.data[0].id,
            });

            this.getData(data.data.data[0].id);
        }
    };

    getActiveLanguages = async () => {
        let data = await languageActive();
        if (data.data.success == 1 && data.data.data.length > 0) {
            this.setState({
                languages: data.data.data,
                language: data.data.data[0].short_name,
            });

            var privacyArray = this.state.privacy;

            for (let i = 0; i < data.data.data.length; i++) {
                var lang = data.data.data[i].short_name;
                privacyArray[lang] = "";
            }

            this.setState({
                privacy: privacyArray,
            });

            this.getActiveShops();
        }
    };

    onChangeLanguage = (e) => {
        let lang = e.target.value;
        this.setState({
            language: lang,
        });

        this.formRef.current.setFieldsValue({
            privacy: this.state.privacy[lang],
        });
    };

    getData = async (id_shop) => {
        var privacyArray = this.state.privacy;

        let data = await privacyGet(id_shop);
        if (
            data.data.success &&
            data.data.data != null &&
            data.data.data.languages.length > 0
        ) {
            for (let i = 0; i < data.data.data.languages.length; i++) {
                var item = data.data.data.languages[i];
                var lang = item.language.short_name;
                privacyArray[lang] = item.content != null ? item.content : "";
            }
        } else {
            for (let i = 0; i < this.state.languages.length; i++) {
                var lang = this.state.languages[i].short_name;
                privacyArray[lang] = "";
            }
        }

        this.setState({
            privacy: privacyArray,
        });

        this.formRef.current.setFieldsValue({
            privacy: privacyArray[this.state.language],
        });
    };

    onFinish = async (values) => {
        if(IS_DEMO) {
            message.warn("You cannot save in demo mode");
            return;
        }

        let data = await privacySave(
            values.shop,
            this.state.privacy,
            this.state.id
        );

        if (data.data.success) window.history.back();
    };

    onFinishFailed = (errorInfo) => {};

    onChangeShop = (e) => {
        this.getData(e);
    };

    onChangeContent = (event, editor) => {
        const data = editor.getData();

        var privacyArray = this.state.privacy;
        privacyArray[this.state.language] = data;
        this.setState({
            privacy: privacyArray,
        });
    };

    render() {
        const { t } = this.props;
        return (
            <PageLayout>
                <Breadcrumb style={{ margin: "16px 0" }}>
                    <Breadcrumb.Item>
                        <Link to="/privacy" className="nav-text">
                            {t("privacy")}
                        </Link>
                    </Breadcrumb.Item>
                    <Breadcrumb.Item>{t("edit")}</Breadcrumb.Item>
                </Breadcrumb>
                <PageHeader
                    className="site-page-header"
                    title={t("edit_privacy")}
                >
                    <Content className="site-layout-background">
                        {this.state.languages.length > 0 ? (
                            <Form
                                ref={this.formRef}
                                name="basic"
                                initialValues={{}}
                                layout="vertical"
                                onFinish={this.onFinish}
                                onFinishFailed={this.onFinishFailed}
                            >
                                <div className="row">
                                    <div className="col-md-12 col-sm-12">
                                        <Radio.Group
                                            value={this.state.language}
                                            onChange={this.onChangeLanguage}
                                            className="float-right"
                                        >
                                            {this.state.languages.map(
                                                (item) => {
                                                    return (
                                                        <Radio.Button
                                                            value={
                                                                item.short_name
                                                            }
                                                            key={
                                                                item.short_name
                                                            }
                                                        >
                                                            {item.name}
                                                        </Radio.Button>
                                                    );
                                                }
                                            )}
                                        </Radio.Group>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-md-4 col-sm-12">
                                        <Form.Item
                                            label={t("shop")}
                                            name="shop"
                                            rules={[
                                                {
                                                    required: true,
                                                    message: t("missing_shop"),
                                                },
                                            ]}
                                            tooltip={t("select_shop")}
                                        >
                                            <Select
                                                placeholder={t("select_shop")}
                                                onChange={this.onChangeShop}
                                            >
                                                {this.state.shops.map(
                                                    (item) => {
                                                        return (
                                                            <Option
                                                                value={item.id}
                                                                key={item.id}
                                                            >
                                                                {item.name}
                                                            </Option>
                                                        );
                                                    }
                                                )}
                                            </Select>
                                        </Form.Item>
                                    </div>
                                    <div className="col-md-8 col-sm-12">
                                        <Form.Item
                                            label={t("privacy_text")}
                                            name="privacy"
                                            tooltip={t("enter_privacy_text")}
                                        >
                                            <CKEditor
                                                editor={ClassicEditor}
                                                data={
                                                    this.state.privacy[
                                                        this.state.language
                                                    ]
                                                }
                                                onChange={this.onChangeContent}
                                            />
                                        </Form.Item>
                                    </div>
                                </div>
                                <Form.Item>
                                    <Button
                                        type="primary"
                                        className="btn-success"
                                        style={{ marginTop: "40px" }}
                                        htmlType="submit"
                                    >
                                        {t("save")}
                                    </Button>
                                </Form.Item>
                            </Form>
                        ) : (
                            <div
                                className="d-flex flex-row justify-content-center"
                                style={{ height: "400px" }}
                            >
                                <Spin
                                    style={{
                                        marginTop: "auto",
                                        marginBottom: "auto",
                                    }}
                                    size="large"
                                />
                            </div>
                        )}
                    </Content>
                </PageHeader>
            </PageLayout>
        );
    }
}

export default withTranslation()(PrivacyAdd);
